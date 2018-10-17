//
//  Throwable.swift
//  JavaLang
//
//  Created by Alsey Coleman Miller on 10/17/18.
//

/**
 The Throwable class is the superclass of all errors and exceptions in the Java language.
 
 Only objects that are instances of this class (or one of its subclasses) are thrown by the Java Virtual Machine or can be thrown by the Java throw statement. Similarly, only this class or one of its subclasses can be the argument type in a catch clause. For the purposes of compile-time checking of exceptions, Throwable and any subclass of Throwable that is not also a subclass of either RuntimeException or Error are regarded as checked exceptions.
 */
open class JavaLangThrowable: JavaLangObject, Swift.Error {
    
    private static let serialVersionUID: Int = -3042686055658047285;
    
    private var detailMessage: String?
    
    private var cause: JavaLangThrowable?
    
    private var suppressedExceptions: [JavaLangThrowable] = []
    
    public override init() {
        
        super.init()
        self.fillInStackTrace()
    }
    
    public init(message: String) {
        
        super.init()
        self.fillInStackTrace()
        self.detailMessage = message
    }
    
    public init(message: String, cause: JavaLangThrowable?) {
        
        super.init()
        self.fillInStackTrace()
        self.detailMessage = message
        self.cause = cause
    }
    
    public init(cause: JavaLangThrowable?) {
        
        super.init()
        self.fillInStackTrace()
        self.cause = cause
        self.detailMessage = cause?.toString()
    }
    
    func fillInStackTrace() {
        
        // TODO: Stack Trace
    }
}

private extension JavaLangThrowable {
    
    /** Message for trying to suppress a null exception. */
    private static let NULL_CAUSE_MESSAGE: String = "Cannot suppress a null exception."
    
    /** Message for trying to suppress oneself. */
    private static let SELF_SUPPRESSION_MESSAGE: String = "Self-suppression not permitted"
    
    /** Caption  for labeling causative exception stack traces */
    private static let CAUSE_CAPTION: String = "Caused by: "
    
    /** Caption for labeling suppressed exception stack traces */
    private static let SUPPRESSED_CAPTION: String = "Suppressed: "
}
