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

  async removeMealEntryFromLog(parent, { id }, ctx, info) {
    return ctx.db.mutation.deleteMealLogEntry(
        {
          where: { id }
        }
      )
  },

}

module.exports = { meal }
