const { getUserId } = require('../../utils')

const meal = {
  async addMealEntryToLog(parent, { id, mealId, mealType }, ctx, info) {
    return ctx.db.mutation.createMealLogEntry(
      {
        data: {
          meal: {
            connect: { id: mealId }
          },
          log: {
            connect: { id },
          },
          mealType
        },
      },
      info
    )
  },
}

module.exports = { meal }
