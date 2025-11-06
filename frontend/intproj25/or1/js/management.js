// CRUD
import { getItems } from "./myLib/fetchUtils.js";

// GET
async function loadPlans(){
    const dialog = document.getElementById("error-server");
    try{
        const plans = await getItems("intproj25/or1/api/v1/study-plans") //"intproj25/or1/api/v1/study-plans"
        return plans
    }catch(error){
        dialog.showModal();
    }
}


export {loadPlans}