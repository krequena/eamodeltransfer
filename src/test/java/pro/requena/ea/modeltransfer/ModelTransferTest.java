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

//    @Test
    public void testLocalToLocal() throws EAModelTransferException {
    	final String source = Thread.currentThread().getContextClassLoader().getResource(SOURCE_EAPX).getPath();
    	final String target = Thread.currentThread().getContextClassLoader().getResource(TARGET_EAPX).getPath();
    	modelTransfer.transfer(source, target, false);
    }

//    @Test
    public void testLocalToDBMS() throws EAModelTransferException {
    	final String source = Thread.currentThread().getContextClassLoader().getResource(SOURCE_EAPX).getPath();
    	final String target = "jdbc:h2:mem:";
    	modelTransfer.transfer(source, target, false);
    }

}
