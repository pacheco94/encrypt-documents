// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

/**
     Este contrato toma un documento y calcula su hash,esta hash es guardado dentro de un array
     de bytes32,para mostrar el contenido del array se hace una verificacion para ver si el documento existe
     de no existir se revierte.
 */

 //@ title < Encriptando Documento>

contract PruebaExistencia1 {
  
  bytes32[] private hashesDocuments ;

  //funcion para guardar un documento dentro del array ya convertido en hash
  //funcion transaccional
  function storageDocument(string memory _pruebas) private {
   bytes32 hash = keccak256(abi.encodePacked(_pruebas));
    hashesDocuments.push(hash);
  }

  //calcular y almacenar un documento
  // funcion transaccional
  function notariar (string memory document) public {
    storageDocument(document);
  }

  //funcion auxiliar para obtener el sha256 de un documento
  //funcion de solo lectura
  function seeHashDocument(string memory _document) public view returns(bytes32){
    return showDocument(_document); //
        
  }

  //funcion para comprobar que el hash se encuentra dentro del array
  function hashProof(bytes32 _valor) public view returns(bytes32){
    bytes32[] memory newvalor = hashesDocuments; //declaro una variable temporal para no recorrer el array en la EVM
    for(uint256 i = 0; i < newvalor.length; ++i){
      if(newvalor[i] == _valor){
        return _valor;
      }
    }
    revert('DOCUMENT DO NOT EXIST');
  }

  //funcion para mostrar el valor del array, es llamada desde la funcion seeHashDocument
  function showDocument(string memory _document) private view returns(bytes32){
    bytes32 hashdocument = keccak256(abi.encodePacked(_document));
    return hashProof(hashdocument);
  }

}
