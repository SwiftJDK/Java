  

// import java.util.concurrent

open /* __abstract */ class Process { 
	// *
	//      * Returns the output stream connected to the normal input of the
	//      * subprocess.  Output to the stream is piped into the standard
	//      * input of the process represented by this {@code Process} object.
	//      *
	//      * <p>If the standard input of the subprocess has been redirected using
	//      * {@link ProcessBuilder#redirectInput(Redirect)
	//      * ProcessBuilder.redirectInput}
	//      * then this method will return a
	//      * <a href="ProcessBuilder.html#redirect-input">null output stream</a>.
	//      *
	//      * <p>Implementation note: It is a good idea for the returned
	//      * output stream to be buffered.
	//      *
	//      * @return the output stream connected to the normal input of the
	//      *         subprocess
	open override func getOutputStream() -> OutputStream! {
	}

	// *
	//      * Returns the input stream connected to the normal output of the
	//      * subprocess.  The stream obtains data piped from the standard
	//      * output of the process represented by this {@code Process} object.
	//      *
	//      * <p>If the standard output of the subprocess has been redirected using
	//      * {@link ProcessBuilder#redirectOutput(Redirect)
	//      * ProcessBuilder.redirectOutput}
	//      * then this method will return a
	//      * <a href="ProcessBuilder.html#redirect-output">null input stream</a>.
	//      *
	//      * <p>Otherwise, if the standard error of the subprocess has been
	//      * redirected using
	//      * {@link ProcessBuilder#redirectErrorStream(boolean)
	//      * ProcessBuilder.redirectErrorStream}
	//      * then the input stream returned by this method will receive the
	//      * merged standard output and the standard error of the subprocess.
	//      *
	//      * <p>Implementation note: It is a good idea for the returned
	//      * input stream to be buffered.
	//      *
	//      * @return the input stream connected to the normal output of the
	//      *         subprocess
	open override func getInputStream() -> InputStream! {
	}

	// *
	//      * Returns the input stream connected to the error output of the
	//      * subprocess.  The stream obtains data piped from the error output
	//      * of the process represented by this {@code Process} object.
	//      *
	//      * <p>If the standard error of the subprocess has been redirected using
	//      * {@link ProcessBuilder#redirectError(Redirect)
	//      * ProcessBuilder.redirectError} or
	//      * {@link ProcessBuilder#redirectErrorStream(boolean)
	//      * ProcessBuilder.redirectErrorStream}
	//      * then this method will return a
	//      * <a href="ProcessBuilder.html#redirect-output">null input stream</a>.
	//      *
	//      * <p>Implementation note: It is a good idea for the returned
	//      * input stream to be buffered.
	//      *
	//      * @return the input stream connected to the error output of
	//      *         the subprocess
	open override func getErrorStream() -> InputStream! {
	}

	// *
	//      * Causes the current thread to wait, if necessary, until the
	//      * process represented by this {@code Process} object has
	//      * terminated.  This method returns immediately if the subprocess
	//      * has already terminated.  If the subprocess has not yet
	//      * terminated, the calling thread will be blocked until the
	//      * subprocess exits.
	//      *
	//      * @return the exit value of the subprocess represented by this
	//      *         {@code Process} object.  By convention, the value
	//      *         {@code 0} indicates normal termination.
	//      * @throws InterruptedException if the current thread is
	//      *         {@linkplain Thread#interrupt() interrupted} by another
	//      *         thread while it is waiting, then the wait is ended and
	//      *         an {@link InterruptedException} is thrown.
	open override func waitFor() -> Int32 {
	}

	// *
	//      * Causes the current thread to wait, if necessary, until the
	//      * subprocess represented by this {@code Process} object has
	//      * terminated, or the specified waiting time elapses.
	//      *
	//      * <p>If the subprocess has already terminated then this method returns
	//      * immediately with the value {@code true}.  If the process has not
	//      * terminated and the timeout value is less than, or equal to, zero, then
	//      * this method returns immediately with the value {@code false}.
	//      *
	//      * <p>The default implementation of this methods polls the {@code exitValue}
	//      * to check if the process has terminated. Concrete implementations of this
	//      * class are strongly encouraged to override this method with a more
	//      * efficient implementation.
	//      *
	//      * @param timeout the maximum time to wait
	//      * @param unit the time unit of the {@code timeout} argument
	//      * @return {@code true} if the subprocess has exited and {@code false} if
	//      *         the waiting time elapsed before the subprocess has exited.
	//      * @throws InterruptedException if the current thread is interrupted
	//      *         while waiting.
	//      * @throws NullPointerException if unit is null
	//      * @since 1.8
	open func waitFor(_ timeout: Int64, _ unit: TimeUnit!) -> Bool {
		var startTime: Int64 = System.nanoTime()
		var rem: Int64 = unit.toNanos(timeout)
		repeat {__try {
				exitValue()
				return true
			}
			__catch ex: IllegalThreadStateException {
				if rem > 0 {
					Thread.sleep(Math.min(TimeUnit.NANOSECONDS.toMillis(rem) + 1, 100))
				}
			}
			rem = unit.toNanos(timeout) - System.nanoTime() - startTime
		} while rem > 0return false
	}

	// *
	//      * Returns the exit value for the subprocess.
	//      *
	//      * @return the exit value of the subprocess represented by this
	//      *         {@code Process} object.  By convention, the value
	//      *         {@code 0} indicates normal termination.
	//      * @throws IllegalThreadStateException if the subprocess represented
	//      *         by this {@code Process} object has not yet terminated
	open override func exitValue() -> Int32 {
	}

	// *
	//      * Kills the subprocess. Whether the subprocess represented by this
	//      * {@code Process} object is forcibly terminated or not is
	//      * implementation dependent.
	open override func destroy() {
	}

	// *
	//      * Kills the subprocess. The subprocess represented by this
	//      * {@code Process} object is forcibly terminated.
	//      *
	//      * <p>The default implementation of this method invokes {@link #destroy}
	//      * and so may not forcibly terminate the process. Concrete implementations
	//      * of this class are strongly encouraged to override this method with a
	//      * compliant implementation.  Invoking this method on {@code Process}
	//      * objects returned by {@link ProcessBuilder#start} and
	//      * {@link Runtime#exec} will forcibly terminate the process.
	//      *
	//      * <p>Note: The subprocess may not terminate immediately.
	//      * i.e. {@code isAlive()} may return true for a brief period
	//      * after {@code destroyForcibly()} is called. This method
	//      * may be chained to {@code waitFor()} if needed.
	//      *
	//      * @return the {@code Process} object representing the
	//      *         subprocess to be forcibly destroyed.
	//      * @since 1.8
	open func destroyForcibly() -> Process! {
		destroy()
		return self
	}

	// *
	//      * Tests whether the subprocess represented by this {@code Process} is
	//      * alive.
	//      *
	//      * @return {@code true} if the subprocess represented by this
	//      *         {@code Process} object has not yet terminated.
	//      * @since 1.8
	open func isAlive() -> Bool {
		__try {
			exitValue()
			return false
		}
		__catch e: IllegalThreadStateException {
			return true
		}
	}
}

