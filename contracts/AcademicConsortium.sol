pragma solidity >=0.4.21 <0.6.0;

/**
Algunos fields fueron despreciados como financiamiento, categoria, localAddress, para limitar
el area de prueba
y se agrego country en los campos por generalizacion

Fields:
name: //nombre de la institucion
email: // correo
country: //pais de origen
city: //luegar especifico
address: // address in the blockchain
index: number of register
type: formal, informal
 **/

contract AcademicConsortium {

    enum CONSORTIUM_TYPE { Public, Private }
    enum CONTRACT_TYPE { Certificate, Consortium }

    address owner;
    // solo el administrador de blockchain
    modifier onlyOwner {
        require(
            msg.sender == owner,
            "Only owner can call this function."
        );
        _;
    }

    struct consortiumDetails {
        address addressConsortium;
        // information fields
        string name;
        string email;
        string country;
        string city;
        string siglas;
        CONSORTIUM_TYPE consortiumType;
    }

    consortiumDetails ownConsortium;

    struct academicCertificate {
        uint indexRegisterCompetencia;
        address addressRegisterCompetencia;
    }

    struct academicCertificateByOwner {
        uint[] registers;
    }
    uint countRegisterList = 0;

    mapping(uint => academicCertificate) registerList;
    mapping(address => academicCertificateByOwner) registerAddressList;

    // Evento para anunciar en el Blockchain que un nuevo certificado ha sido agregado

    event academicConsorsium(CONTRACT_TYPE contractType, address addressConsortium, string name);

    constructor(
        address ad,
        string memory name,
        string memory email,
        string memory country,
        string memory city,
        string memory siglas,
        CONSORTIUM_TYPE consortiumType
    ) public {
        ownConsortium.addressConsortium = ad;
        ownConsortium.name = name;
        ownConsortium.email = email;
        ownConsortium.country = country;
        ownConsortium.city = city;
        ownConsortium.siglas = siglas;
        ownConsortium.consortiumType = consortiumType;

        emit academicConsorsium(CONTRACT_TYPE.Consortium, ownConsortium.addressConsortium, ownConsortium.name);
    }

    // get details of the consorcio
    function get () public view returns (
        address addressConsortium,
        string memory name,
        string memory email,
        string memory country,
        string memory city,
        string memory siglas,
        CONSORTIUM_TYPE consortiumType
    ) {
        addressConsortium = ownConsortium.addressConsortium;
        name = ownConsortium.name;
        email = ownConsortium.email;
        country = ownConsortium.country;
        city = ownConsortium.city;
        siglas = ownConsortium.siglas;
        consortiumType = ownConsortium.consortiumType;
    }

    // modify consortium info
    function set (
        address addressConsortium,
        string memory name,
        string memory email,
        string memory country,
        string memory city,
        string memory siglas,
        CONSORTIUM_TYPE consortiumType
    ) public {
        ownConsortium.addressConsortium = addressConsortium;
        ownConsortium.name = name;
        ownConsortium.email = email;
        ownConsortium.country = country;
        ownConsortium.city = city;
        ownConsortium.siglas = siglas;
        ownConsortium.consortiumType = consortiumType;

        emit academicConsorsium(CONTRACT_TYPE.Consortium, ownConsortium.addressConsortium, ownConsortium.name);
    }

}