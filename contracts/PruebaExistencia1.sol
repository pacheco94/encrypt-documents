// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract PruebaExistencia1 {
  // estado
  string public prueba ;

  //calcular y almacenar la prueba de un documento
  // funcion transaccional
  function notariar (string memory document) public {
    prueba = document;
  }

  //funcion auxiliar para obtener el sha256 de un documento
  //funcion de solo lectura
  function proofor() public view returns(bytes32){
    bytes32 result;
      result = keccak256(abi.encodePacked(prueba));
      return result;
  }

}
