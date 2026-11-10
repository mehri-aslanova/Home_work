const boxes = [
    { width: 50, height: 40 },
    { width: 100, height: 70 },
    { width: 80, height: 100 },
    { width: 150, height: 60 }
];

const wrapper = document.getElementById('wrapper');

for (let i = 0; i < boxes.length; i++) {

    const box = document.createElement('div');

    box.style.width = boxes[i].width + 'px';
    box.style.height = boxes[i].height + 'px';

    box.classList.add('box');

    wrapper.appendChild(box);
}


