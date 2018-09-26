
// import java.io
// import java.util
// import java.util.concurrent
// import java.security

internal final class UNIXProcess : Process { 
	private let pid: Int32 = 0
	private var exitcode: Int32 = 0
	private var hasExited: Bool = false
	private var stdin: OutputStream!
	private var stdout: InputStream!
	private var stderr: InputStream!
	// *
	//      * The thread pool of "process reaper" daemon threads.
	//      
	// 
	private let processReaperExecutor: Executor! = doPrivileged(class {
		func run() {
			return Executors.newCachedThreadPool(ProcessReaperThreadFactory())
		}
	})

	// this is for the reaping thread
	private __extern func waitForProcessExit(_ pid: Int32) -> Int32

	// *
	//      * Create a process using fork(2) and exec(2).
	//      *
	//      * @param fds an array of three file descriptors.
	//      *        Indexes 0, 1, and 2 correspond to standard input,
	//      *        standard output and standard error, respectively.  On
	//      *        input, a value of -1 means to create a pipe to connect
	//      *        child and parent processes.  On output, a value which
	//      *        is not -1 is the parent pipe fd corresponding to the
	//      *        pipe which has been created.  An element of this array
	//      *        is -1 on input if and only if it is <em>not</em> -1 on
	//      *        output.
	//      * @return the pid of the subprocess
	private __extern func forkAndExec(_ prog: Int8[], _ argBlock: Int8[], _ argc: Int32, _ envBlock: Int8[], _ envc: Int32, _ dir: Int8[], _ fds: Int32[], _ redirectErrorStream: Bool) -> Int32

	internal init(_ prog: Int8[], _ argBlock: Int8[], _ argc: Int32, _ envBlock: Int8[], _ envc: Int32, _ dir: Int8[], _ fds: Int32[], _ redirectErrorStream: Bool) {
		pid = forkAndExec(prog, argBlock, argc, envBlock, envc, dir, fds, redirectErrorStream)
		__try {
			doPrivileged(class {
				func run() {
					initStreams(fds)
					return nil
				}
			})
		}
		__catch ex: PrivilegedActionException {
			throw (ex.getException() as? IOException)
		}
	}

	internal static func newFileDescriptor(_ fd: Int32) -> FileDescriptor! {
		var fileDescriptor: FileDescriptor! = FileDescriptor()
		fileDescriptor.setInt$(fd)
		return fileDescriptor
	}

	internal func initStreams(_ fds: Int32[]) {
		stdin = (fds[0] == -1 ? ProcessBuilder.NullOutputStream.INSTANCE : ProcessPipeOutputStream(fds[0]))
		stdout = (fds[1] == -1 ? ProcessBuilder.NullInputStream.INSTANCE : ProcessPipeInputStream(fds[1]))
		stderr = (fds[2] == -1 ? ProcessBuilder.NullInputStream.INSTANCE : ProcessPipeInputStream(fds[2]))
		processReaperExecutor.execute(class Runnable {
			func run() {
				var exitcode: Int32 = waitForProcessExit(pid)
				UNIXProcess.this.processExited(exitcode)
			}
		})
	}

	internal func processExited(_ exitcode: Int32) {
		if stdout is ProcessPipeInputStream! {
			(stdout as? ProcessPipeInputStream).processExited()
		}
		if stderr is ProcessPipeInputStream! {
			(stderr as? ProcessPipeInputStream).processExited()
		}
		if stdin is ProcessPipeOutputStream! {
			(stdin as? ProcessPipeOutputStream).processExited()
		}
	}

	open func getOutputStream() -> OutputStream! {
		return stdin
	}

	open func getInputStream() -> InputStream! {
		return stdout
	}

	open func getErrorStream() -> InputStream! {
		return stderr
	}

	open func waitFor() -> Int32 {
		while !hasExited {
			wait()
		}return exitcode
	}

	open func exitValue() -> Int32 {
		if !hasExited {
			throw IllegalThreadStateException("process hasn\'t exited")
		}
		return exitcode
	}

	private static __extern func destroyProcess(_ pid: Int32)

	open func destroy() {
		//  There is a risk that pid will be recycled, causing us to
		//  kill the wrong process!  So we only terminate processes
		//  that appear to still be running.  Even with this check,
		//  there is an unavoidable race condition here, but the window
		//  is very small, and OSes try hard to not recycle pids too
		//  soon, so this is quite safe.
		__try {
			stdin.close()
		}
		__catch ignored: IOException {
		}
		__try {
			stdout.close()
		}
		__catch ignored: IOException {
		}
		__try {
			stderr.close()
		}
		__catch ignored: IOException {
		}
	}

	// @Override
	public func toString() -> String! {
		var sb: StringBuilder! = StringBuilder("Process[pid=")
		sb.append(pid)
		if hasExited {
			sb.append(" ,hasExited=true, exitcode=")
			sb.append(exitcode)
			sb.append("]")
		} else {
			sb.append(", hasExited=false]")
		}
		return sb.toString()
	}

	// This routine initializes JNI field offsets for the class
	private static __extern func initIDs()

	private init() {
		initIDs()
	}

	class ProcessReaperThreadFactory : ThreadFactory { 
		private let group: ThreadGroup! = getRootThreadGroup()

		private static func getRootThreadGroup() -> ThreadGroup! {
			return doPrivileged(class {
				func run() {
					var root: ThreadGroup! = Thread.currentThread().getThreadGroup()
					while root.getParent() != nil {
						root = root.getParent()
					}return root
				}
			})
		}

		open func newThread(_ grimReaper: Runnable!) -> Thread! {
			//  Our thread stack requirement is quite modest.
			var t: Thread! = Thread(group, grimReaper, "process reaper", 32768)
			t.setDaemon(true)
			//  A small attempt (probably futile) to avoid priority inversion
			t.setPriority(Thread.MAX_PRIORITY)
			return t
		}
	}

	internal class ProcessPipeInputStream : BufferedInputStream { 
		internal init(_ fd: Int32) {
			super.init(FileInputStream(newFileDescriptor(fd), true))
		}

		private static func drainInputStream(_ `in`: InputStream!) -> Int8[] {
			if `in` == nil {
				return nil
			}
			var n: Int32 = 0
			var j: Int32
			var a: Int8[] = nil
			while true {
				j = `in`.available()
				if !j > 0 {
					break
				}
				a = (a == nil ? Int8[](count: j) : Arrays.copyOf(a, n + j))
				n = n + `in`.read(a, n, j)
			}return ((a == nil) | (n == a.length) ? a : Arrays.copyOf(a, n))
		}

		// * Called by the process reaper thread when the process exits.
		internal func processExited() {
			__try {
				var `in`: InputStream! = self.`in`
				if `in` != nil {
					var stragglers: Int8[] = drainInputStream(`in`)
					`in`.close()
					self.`in` = (stragglers == nil ? ProcessBuilder.NullInputStream.INSTANCE : ByteArrayInputStream(stragglers))
					if buf == nil {
						self.`in` = nil
					}
				}
			}
			__catch ignored: IOException {
			}
		}
	}

	internal class ProcessPipeOutputStream : BufferedOutputStream { 
		internal init(_ fd: Int32) {
			super.init(FileOutputStream(newFileDescriptor(fd), true))
		}

		// * Called by the process reaper thread when the process exits.
		internal func processExited() {
			var out: OutputStream! = self.out
			if out != nil {
				__try {
					out.close()
				}
				__catch ignored: IOException {
				}
				self.out = ProcessBuilder.NullOutputStream.INSTANCE
			}
		}
	}
}

