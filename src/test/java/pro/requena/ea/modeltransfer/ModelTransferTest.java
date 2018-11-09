package pro.requena.ea.modeltransfer;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import pro.requena.ea.modeltransfer.exceptions.EAModelTransferException;

/**
 * Model Transfer test class.
 * @author krequena
 *
 */
public class ModelTransferTest {
    
    private static final String SOURCE_EAPX = "source.eapx";
    private static final String TARGET_EAPX = "target.eapx";

    private ModelTransfer modelTransfer = null;
    
    @Before
    public void init() {
        modelTransfer = new ModelTransfer();
    }
    
    @After
    public void destroy() {
        modelTransfer = null;
    }


}
