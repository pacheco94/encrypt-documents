 module.exports = async function main(callback){
 try{
         //Instanciando el contrato
         const PruebaExistencia1 = artifacts.require('PruebaExistencia1');
         const instanciaPrueba = await PruebaExistencia1.deployed();

         //Interactuando con el contrato
         
         var hashes = ['Document1','Document2','Document3'];
         for(let i = 0; i < hashes.length; ++i){
            hash = hashes[i];
            console.log('Mostando los hash',await instanciaPrueba.seeHashDocument(hash));
         }     

    callback(0);
 }catch(err){
    console.log(err);
    callback(1);
 }

}