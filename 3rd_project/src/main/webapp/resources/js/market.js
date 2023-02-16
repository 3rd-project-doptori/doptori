const pageGroup = 1
const pageCount = 5
const totalPage = 11

let lastNumber = pageGroup * pageCount // 5
if (lastNumber > totalPage) {
  lastNumber = totalPage
}
let firstNumber = lastNumber - (pageCount - 1) // 1

const next = lastNumber + 1 // 6
const prev = firstNumber - 1 // 0

// 1~5만큼 페이지네이션 그려줌
for (let i = firstNumber; i <= lastNumber; i++) {
  html += `<button class="pageNumber" id="page_${i}">${i}</button>`
  const pageGroup = 3
    const pageCount = 5
    const totalPage = 11

    let lastNumber = pageGroup * pageCount // 15
    if (lastNumber > totalPage) {
    lastNumber = totalPage // 11
    }
    let firstNumber = lastNumber - (pageCount - 1) // 7

    const next = lastNumber + 1 // 12
    const prev = firstNumber - 1 // 6
}