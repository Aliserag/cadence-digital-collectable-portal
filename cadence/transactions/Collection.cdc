import Collectibles from "../contracts/Collectibles.cdc"
transaction {
    prepare(signer: AuthAccount) {
        if signer.borrow<&Collectibles.Collection>(from: Collectibles.CollectionStoragePath) == nil {
            let collection <- Collectibles.createEmptyCollection()
            signer.save(<-collection, to: Collectibles.CollectionStoragePath)
            let cap = signer.capabilities.storage.issue<&{Collectibles.CollectionPublic}>(Collectibles.CollectionStoragePath)
            signer.capabilities.publish( cap, at: Collectibles.CollectionPublicPath)
        }
    }
}