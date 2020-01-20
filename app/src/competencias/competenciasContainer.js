import React from "react";

import ContractDataContainer from "containers/ContractDataContainer";

class CompetenciasContainer extends React.Component {
  // metodo para obtener valores de un contrato inteligente

  render(){
    return(
      <ContractDataContainer
        contractAddress='0x422F84F458536D1657C3BA1f055035E022034c6f'
        contractName='CompetenciaAcademica'
        MethodName='get'
      />)
  };
}
export default CompetenciasContainer;