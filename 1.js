//1 задание
function checkNumber(number) {
    if (number > 0) {
        console.log("Число положительное");
    } else if (number < 0) {
        console.log("Число отрицательное");
    } else {
        console.log("Это ноль");
    }

    if (number % 2 == 0) {
        console.log("Число чётное");
    } else {
        console.log("Число нечётное");
    }
}

const number = Number(prompt("Введите число:"));

checkNumber(number);

//2 задание (через цикл)
{
const numbers = [4, 8, 15, 16, 23, 42];

let sum = 0;
let max = numbers[0];
let greaterThan10 = [];

for (let i = 0; i < numbers.length; i++) {
    sum += numbers[i];

    if (numbers[i] > max) {
        max = numbers[i];
    }

    if (numbers[i] > 10) {
        greaterThan10.push(numbers[i]);
    }
}

console.log("Сумма:", sum);
console.log("Максимальное число:", max);
console.log("Числа больше 10:", greaterThan10);
}

//2 задание (через методы массивов)
{
const numbers = [4, 8, 15, 16, 23, 42];

const sum = numbers.reduce((total, number) => total + number, 0);

const max = Math.max(...numbers);

const greaterThan10 = numbers.filter(number => number > 10);

console.log("Сумма:", sum);
console.log("Максимальное число:", max);
console.log("Числа больше 10:", greaterThan10);
}

//3 задание
const students = [
    { name: "Иван", grade: 5 },
    { name: "Анна", grade: 4 },
    { name: "Пётр", grade: 3 },
    { name: "Мария", grade: 4 },
    { name: "Олег", grade: 2 }
];

const requiredGrade = 3;

const goodStudents = students.filter(student => student.grade > requiredGrade);

console.log("Ученики с оценкой выше", requiredGrade + ":");

for (const student of goodStudents) {
    console.log(student.name, student.grade);
}

const sum = students.reduce((total, student) => {
    return total + student.grade;
}, 0);

const average = sum / students.length;

console.log("Средняя оценка:", average);

//4 задание
function guessNumber() {
    const secretNumber = Math.floor(Math.random() * 10) + 1;

    let userNumber;

    while (userNumber !== secretNumber) {
        userNumber = Number(prompt("Угадайте число от 1 до 10:"));

        if (userNumber === secretNumber) {
            alert("Поздравляю! Вы угадали!");
        } else if (userNumber < secretNumber) {
            alert("Загаданное число больше");
        } else {
            alert("Загаданное число меньше");
        }
    }
}

guessNumber();