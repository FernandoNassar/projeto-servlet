package exceptions;

public class UsuarioInexistenteException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	public UsuarioInexistenteException(String msg) {
		super(msg);
	}
}
