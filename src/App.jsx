import React, { useState } from 'react'

const App = () => {

  const [name, setName] = useState("");

  return (
    <>
    <h1>Containerization of first React app</h1>

    <h2>Displaying name: {name}</h2>

    <button onClick={() => setName("Adarsh")}>Display name</button>

    <p>Learning how to manually dockerise an app and automation as well</p>
    <p>For manual depoly - code change - push to github - build and run container</p>

    <p>Manually deployed github action workflows are pushing the code and pushing docker image to docker hub</p>
    <p>DOCKER hub token regenrate - scope - read, write, delete</p>
    </>
  )
}

export default App