const { expect } = require('chai');


const PruebaExistencia1 = artifacts.require('PruebaExistencia1.sol');

contract ('PruebaExistancia1', function([owner]){
     const hash = 'Document1';
    beforeEach(async () =>{
        this.instance = await PruebaExistencia1.new({from: owner});
     });

   // Testing function notariar and the sime time seeHashDocument function  
   it('Should add document',async () => {
    const result = await this.instance.notariar('Document1');
    expect(await this.instance.seeHashDocument(hash),result, 'Comparing hash');
    });  

    //Testing hashProof function
    it('Should have not document', async () => {
       try{
           await this.instance.seeHashDocument('Document2');
        assert(false);
       }catch(err){
        assert(err);
       }
    });

});

  
 

 