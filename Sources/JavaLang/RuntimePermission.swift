
public final class RuntimePermission : BasicPermission { 
	private let serialVersionUID: Int64 = 7399184964622342223

	public init(_ name: String!) {
		super.init(name)
	}

	public init(_ name: String!, _ actions: String!) {
		super.init(name, actions)
	}
}

