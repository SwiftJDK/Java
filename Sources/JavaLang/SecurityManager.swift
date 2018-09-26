
// import java.io
// import java.net

open class SecurityManager { 
	// *
	//      * @deprecated Use {@link #checkPermission} instead.
	//      
	// 
	//@Deprecated
	public var inCheck: Bool = false

	// *
	//      * @deprecated Use {@link #checkPermission} instead.
	//@Deprecated
	open func getInCheck() -> Bool {
		return inCheck
	}

	public init() {
	}

	open func getClassContext() -> Class![] {
		return nil
	}

	// *
	//      * @deprecated Use {@link #checkPermission} instead.
	//@Deprecated
	open func currentClassLoader() -> ClassLoader! {
		return nil
	}

	// *
	//      * @deprecated Use {@link #checkPermission} instead.
	//@Deprecated
	open func currentLoadedClass() -> Class! {
		return nil
	}

	// *
	//      * @deprecated Use {@link #checkPermission} instead.
	//@Deprecated
	open func classDepth(_ name: String!) -> Int32 {
		return -1
	}

	// *
	//      * @deprecated Use {@link #checkPermission} instead.
	//@Deprecated
	open func classLoaderDepth() -> Int32 {
		return -1
	}

	// *
	//      * @deprecated Use {@link #checkPermission} instead.
	//@Deprecated
	open func inClass(_ name: String!) -> Bool {
		return false
	}

	// *
	//      * @deprecated Use {@link #checkPermission} instead.
	//@Deprecated
	open func inClassLoader() -> Bool {
		return false
	}

	open func getSecurityContext() -> Object! {
		return nil
	}

	open func checkPermission(_ perm: Permission!) {
	}

	open func checkPermission(_ perm: Permission!, _ context: Object!) {
	}

	open func checkCreateClassLoader() {
	}

	open func checkAccess(_ t: Thread!) {
	}

	open func checkAccess(_ g: ThreadGroup!) {
	}

	open func checkExit(_ status: Int32) {
	}

	open func checkExec(_ cmd: String!) {
	}

	open func checkLink(_ lib: String!) {
	}

	open func checkRead(_ fd: FileDescriptor!) {
	}

	open func checkRead(_ file: String!) {
	}

	open func checkRead(_ file: String!, _ context: Object!) {
	}

	open func checkWrite(_ fd: FileDescriptor!) {
	}

	open func checkWrite(_ file: String!) {
	}

	open func checkDelete(_ file: String!) {
	}

	open func checkConnect(_ host: String!, _ port: Int32) {
	}

	open func checkConnect(_ host: String!, _ port: Int32, _ context: Object!) {
	}

	open func checkListen(_ port: Int32) {
	}

	open func checkAccept(_ host: String!, _ port: Int32) {
	}

	open func checkMulticast(_ maddr: InetAddress!) {
	}

	// *
	//      * @deprecated use {@link #checkMulticast(java.net.InetAddress)} instead.
	//@Deprecated
	open func checkMulticast(_ maddr: InetAddress!, _ ttl: Int8) {
	}

	open func checkPropertiesAccess() {
	}

	open func checkPropertyAccess(_ key: String!) {
	}

	open func checkTopLevelWindow(_ window: Object!) -> Bool {
		return true
	}

	open func checkPrintJobAccess() {
	}

	open func checkSystemClipboardAccess() {
	}

	open func checkAwtEventQueueAccess() {
	}

	open func checkPackageAccess(_ pkg: String!) {
	}

	open func checkPackageDefinition(_ pkg: String!) {
	}

	open func checkSetFactory() {
	}

	open func checkMemberAccess(_ clazz: Class!, _ which: Int32) {
	}

	open func checkSecurityAccess(_ target: String!) {
	}

	// *
	//      * Returns the current thread's thread group.
	open func getThreadGroup() -> ThreadGroup! {
		return Thread.currentThread().getThreadGroup()
	}
}

