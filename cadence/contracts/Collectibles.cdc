import NonFungibleToken from "./interfaces/NonFungibleToken.cdc"

pub contract Collectibles: NonFungibleToken{

  pub var totalSupply: UInt64

  pub resource NFT: NonFungibleToken.INFT{
        pub let id: UInt64
        pub var name: String
        pub var image: String

        init(_id:UInt64, _name:String, _image:String){
            self.id = _id
            self.name = _name
            self.image = _image
        }
    }

  init(){
  	self.totalSUpply = 0
  }
}