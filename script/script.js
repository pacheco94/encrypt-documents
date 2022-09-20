 module.exports = async function main(callback){
 try{
         //Instanciando el contrato
         const PruebaExistencia1 = artifacts.require('PruebaExistencia1');
         const instanciaPrueba = await PruebaExistencia1.deployed();

         //Interactuando con el contrato
         //var hash = await instanciaPrueba.notariar('prueba una');
         var hash = await instanciaPrueba.proofor();
         console.log('Mostrando el hash:', hash); //revisar

    callback(0);
 }catch(err){
    console.log(err);
    callback(1);
 }

}