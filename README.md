# eamodeltransfer - Java library for Enterprise Architect

## Description

EAModelTransfer is an open-source Java library which aims to provide a high-performant solution to an specific commercial product (Sparx Systems Enterprise Architect).

Specifically, it provides a way to perform Model Transfer operations that are not supported by the product API.

## Dependencies

This library makes use of:
* UCanAccess (https://ucanaccess.sourceforge.net) to use Microsoft JET databases.
* SLF4J (https://www.slf4j.org/) as logging façade.
* Commons Lang (https://commons.apache.org/proper/commons-lang/).
* H2 (http://www.h2database.com) as in-memory testing database.

## Documentation and Usage

After importing the library in a Java project, it can easily be used as follows:
``` 
    import pro.requena.ea.modeltransfer.ModelTransfer;
    [...]
    ModelTransfer modelTransfer = new ModelTransfer();
    modelTransfer.transfer(source, target, batchInsert);
```

Take a look at the project Wiki page for more information: <https://github.com/krequena/eamodeltransfer/wiki>.

## Contributing

We believe in the open-source collaboration model, this is, we will gladly welcome both your suggestions and -specially- your code to keep improving this library.

## Disclaimer

The vendors cited in this project are named only to maintain context.
