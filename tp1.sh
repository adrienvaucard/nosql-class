// Create Database
use tp

// Create Collection
db.createCollection("sports")

// Add Fields
db.sports.insert({'isCool': true})

// Add "teams" and "isTeamRequired"
db.sports.updateMany({isCool: true}, { $set: { title: "Football", isTeamRequired: true}}, {upsert: true})

// Add "minPlayers"
db.sports.updateMany({isTeamRequired: true}, { $set: { minPlayers: 11}}, {upsert: true})

// Increment minPlayers by 10
db.sports.updateMany({isTeamRequired: true}, { $inc: { minPlayers: 10}}, {upsert: true})

// Add "team[]"
db.sports.updateMany({}, { $set: { team: []}})

// Populate "team[]" when isRequiredTeam is true
db.sports.updateMany({isTeamRequired: true}, { $set: { team: [{"name": "John Doe"}, {"name": "Brice De Nice"}]}}, {upsert: true})

// Add Property to each player 
db.sports.updateMany({isRequiredTeam: true}, {$set: {sports.$.isCaptain: ""}})