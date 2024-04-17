document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("#addForm") as HTMLFormElement;
    const items = document.getElementById("items") as HTMLElement;
    const submitButton = document.getElementById("submit") as HTMLButtonElement;
    const successMessage = document.getElementById("lblsuccess") as HTMLElement;

    let editItem: HTMLElement | null = null;

    form.addEventListener("submit", addItem);
    items.addEventListener("click", handleItemClick);

    function addItem(e: Event) {
        e.preventDefault();

        const itemInput = document.getElementById("item") as HTMLInputElement;
        const newItem = itemInput.value.trim();

        if (newItem === "") return;

        if (editItem) {
            editItem.textContent = newItem;
            editItem = null;
            submitButton.innerText = "Submit";
            successMessage.textContent = "Text edited successfully";
        } else {
            const li = createListItem(newItem);
            items.appendChild(li);
            successMessage.textContent = "Text added successfully";
        }

        successMessage.style.display = "block";
        setTimeout(() => {
            successMessage.style.display = "none";
        }, 3000);

        itemInput.value = "";
    }

    function handleItemClick(e: Event) {
        const target = e.target as HTMLElement;

        if (target.classList.contains("delete")) {
            if (confirm("Are you sure?")) {
                const li = target.parentNode as HTMLElement;
                items.removeChild(li);
                successMessage.textContent = "Text deleted successfully";
                successMessage.style.display = "block";
                setTimeout(() => {
                    successMessage.style.display = "none";
                }, 3000);
            }
        }

        if (target.classList.contains("edit")) {
            const listItem = target.parentNode as HTMLElement;
            const text = listItem.firstChild?.textContent;
            if (text) {
                const itemInput = document.getElementById("item") as HTMLInputElement;
                itemInput.value = text;
                submitButton.innerText = "EDIT";
                editItem = listItem.firstChild as HTMLElement;
            }
        }
    }

    function createListItem(text: string): HTMLLIElement {
        const li = document.createElement("li");
        li.className = "list-group-item bg-light";
        li.appendChild(document.createTextNode(text));

        const deleteButton = document.createElement("button");
        deleteButton.className = "btn-danger btn btn-sm float-right delete";
        deleteButton.appendChild(document.createTextNode("Delete"));
        li.appendChild(deleteButton);

        const editButton = document.createElement("button");
        editButton.className = "btn-success btn btn-sm float-right edit";
        editButton.appendChild(document.createTextNode("Edit"));
        li.appendChild(editButton);

        return li;
    }
});
