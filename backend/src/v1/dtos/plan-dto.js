function mapData(dto){
    return {
        id: dto.id,
        planCode: dto.plan_code,
        nameEng: dto.name_eng,
        nameTh: dto.name_th
    }
}
function mapDataList(dtos) {
  return dtos.map(mapData);
}

module.exports = {
  mapData,
  mapDataList,
};