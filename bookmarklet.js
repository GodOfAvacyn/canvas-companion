let box = document.createElement('div');
// Set some styles for the box
box.style.position = 'fixed';
box.style.top = '0';
box.style.right = '0';
box.style.width = '200px';
box.style.height = '100px';
box.style.backgroundColor = 'lightblue';
box.style.border = 'solid black 1px';
// Create a p element for the text
let text = document.createElement('p');
// Set some styles for the text
text.style.textAlign = 'center';
text.style.marginTop = '40px';
text.style.fontWeight = 'bold';
// Set the text content
text.textContent = "Hey! here's your bookmarklet!";
// Append the text to the box
box.appendChild(text);
// Append the box to the body
document.body.appendChild(box);