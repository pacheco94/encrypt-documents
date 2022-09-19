// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract PruebaExistencia1 {
  // estado
  bytes32 public prueba ;

  //calcular y almacenar la prueba de un documento
  // funcion transaccional
  function notariar (bytes32 document) public {
    prueba = bytes32(document);
  }

  //funcion auxiliar para obtener el sha256 de un documento
  //funcion de solo lectura
  function proofor(bytes32 document) pure external returns(bytes32){
    bytes32 salida;
     salida = keccak256(abi.encodePacked(document));
     return salida;
  }

}
