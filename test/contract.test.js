const { expect } = require('chai');


const PruebaExistencia1 = artifacts.require('PruebaExistencia1.sol');

contract ('PruebaExistancia1', function([owner]){
     const hash = 'george';
    beforeEach(async () =>{
        this.instance = await PruebaExistencia1.new({from: owner});
     });

   // Testing function notariar and the sime time seeHashDocument function  
   it('Should add document',async () => {
    const result = await this.instance.notariar('george');
    expect(await this.instance.seeHashDocument(hash),result, 'Comparing hash');
    });  

    //Testing hashProof function
    it('Should have not document', async () => {
       try{
           await this.instance.seeHashDocument('humberto');
        assert(false);
       }catch(err){
        assert(err);
       }
    });

});

  
 

 