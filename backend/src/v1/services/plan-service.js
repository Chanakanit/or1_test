const repo = require("../repositories/plan-repositorie")

module.exports = {
    getAllPlan: async function(){
        const plans = await repo.findAll();
        return plans
    }
}