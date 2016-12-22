document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const handleAddPlace = (e) => {
    e.preventDefault();

    const favoriteInput = document.querySelector(".favorite-input");
    const favorite = favoriteInput.value;
    favoriteInput.value = "";

    const newLi = document.createElement("li");
    newLi.textContent = favorite;

    const favoritesList = document.getElementById("sf-places");
    favoritesList.appendChild(newLi);
  };

  const faveSubmitButton = document.querySelector(".favorite-submit");
  faveSubmitButton.addEventListener("click", handleAddPlace);



  // adding new photos
  const togglePhotoForm = (e) => {
      const photoForm = document.querySelector(".photo-form-container");
      if (photoForm.className === "photo-form-container") {
        photoForm.className = "photo-form-container hidden";
      }
      else {
        photoForm.className = "photo-form-container";
      }
  };

  const togglePhotoFormButton = document.querySelector(".photo-show-button");
  togglePhotoFormButton.addEventListener("click", togglePhotoForm);

  // --- your code here!
  const handleAddPhoto = (e) => {
    e.preventDefault();
    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoUrl;

    const newLi = document.createElement("li");
    newLi.appendChild(newImg);

    const dogsPhotos = document.querySelector(".dog-photos");
    dogsPhotos.appendChild(newLi);

  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handleAddPhoto);

});
