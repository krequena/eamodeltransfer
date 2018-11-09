package pro.requena.ea.modeltransfer.exceptions;

/**
 * EA Model Transfer library generic exception.
 * @author krequena
 *
 */
public class EAModelTransferException extends Exception {

    private static final long serialVersionUID = 1L;

    /**
     * Constructor for the library generic exception.
     * @param exception Inner exception.
     */
    public EAModelTransferException(Exception exception) {
        super(exception);
    }

    /**
     * Exception message.
     * @param message Content of the exception.
     */
    public EAModelTransferException(String message) {
        super(message);
    }
}
