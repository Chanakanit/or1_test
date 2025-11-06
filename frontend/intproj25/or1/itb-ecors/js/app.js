import { loadPlans } from "./management.js";

document.addEventListener("DOMContentLoaded", async () => {
  const plans = await loadPlans()
  renderTable(plans)
});
 
function renderTable(plans) {
  const table = document.querySelector(".planList");
 
  table.innerHTML = "";
 
  const thead = document.createElement("thead");
  thead.innerHTML = `
    <tr>
      <th>ID</th>
      <th>Plan Code</th>
      <th>English Name</th>
      <th>Thai Name</th>
    </tr>
  `;
  table.appendChild(thead);
 
  const tbody = document.createElement("tbody");
  plans.forEach((plan) => {
    const tr = document.createElement("tr");
    tr.setAttribute("class","ecors-row")
    tr.innerHTML = `
    <td>${plan.id}</td>
    <td>${plan.planCode}</td>
    <td>${plan.nameEng}</td>
    <td>${plan.nameTh}</td>
    `;
    tbody.appendChild(tr);
    });
 
  table.appendChild(tbody);
}

