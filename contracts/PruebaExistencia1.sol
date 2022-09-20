// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract PruebaExistencia1 {
  // estado
  bytes32[] private pruebas ;

  //funcion para guardar un documento dentro del array
  //funion de transaccional
  function storagePrueba(string memory _pruebas) private {
   bytes32 hash = keccak256(abi.encodePacked(_pruebas));
    pruebas.push(hash);
  }

  //calcular y almacenar la prueba de un documento
  // funcion transaccional
  function notariar (string memory document) public {
    storagePrueba(document);
  }

  //funcion auxiliar para obtener el sha256 de un documento
  //funcion de solo lectura
  function proofor() public view returns(bytes32){
    bytes32 result;
      result = keccak256(abi.encodePacked(pruebas));
      return result;
  }

  //funcion para comprobar que el hash se encuentra dentro del array
  function hashProof(bytes32 _valor) public view returns(bytes32){
    bytes32[] memory newvalor = pruebas; //declaro una variable temporal para no recorrer el array pruebas en la EVM
    for(uint256 i = 0; i < newvalor.length; ++i){
      if(newvalor[i] == _valor){
        return _valor;
      }
    }
    revert('DOCUMENT DO NOT EXIST');
  }

  //funcion para mostrar el valor del array
  function showDocument(string memory _document) public view returns(bytes32){
    bytes32 hashdocument = keccak256(abi.encodePacked(_document));
    return hashProof(hashdocument);
  }

}
