const log = {
  async createLog(parent, { userId }, ctx, info) {
    return ctx.db.mutation.createLog(
      {
        data: {
          user: {
              connect: { id: userId }
          }
        },
      },
      info
    )
  },
}

module.exports = { log }
