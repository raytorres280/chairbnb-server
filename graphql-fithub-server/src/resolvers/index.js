const { Query } = require('./Query')
const { Subscription } = require('./Subscription')
const { auth } = require('./Mutation/auth')
const { post } = require('./Mutation/post')
const { meal } = require('./Mutation/meal')
const { log } = require('./Mutation/log')
const { AuthPayload } = require('./AuthPayload')

module.exports = {
  Query,
  Mutation: {
    ...auth,
    ...post,
    ...meal,
    ...log
  },
  Subscription,
  AuthPayload,
}
