import NonFungibleToken from "../interfaces/NonFungibleToken.cdc"
import Collectibles from "../contracts/Collectibles.cdc"

transaction(name:String, image:String){
    let receiverCollectionRef: &{NonFungibleToken.CollectionPublic}
    prepare(signer:AuthAccount){
        self.receiverCollectionRef = signer.borrow<&Collectibles.Collection>(from: Collectibles.CollectionStoragePath)
      ?? panic("could not borrow Collection reference")
    }
    execute{
        let nft <- Collectibles.mintNFT(name:name, image:image)
        self.receiverCollectionRef.deposit(token: <-nft)
    }
}
