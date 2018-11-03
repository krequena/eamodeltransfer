package pro.requena.ea.modeltransfer;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import pro.requena.ea.modeltransfer.exceptions.EAModelTransferException;

public class ModelTransferTest {

    private ModelTransfer modelTransfer = null;
    
    @Before
    public void init() {
        modelTransfer = new ModelTransfer();
    }
    
    @After
    public void destroy() {
        modelTransfer = null;
    }

    @Test
    public void testModelTransfer() throws EAModelTransferException {
        String source = "source.eap";
        String destination = "";
        modelTransfer.transfer(source, destination);
    }

}
