import React, { useState } from 'react'

const App = () => {

  const [name, setName] = useState("");

  return (
    <>
    <h1>Containerization of first React app</h1>

    <h2>Displaying name: {name}</h2>

    <button onClick={() => setName("Adarsh")}>Display name</button>
    </>
  )
}

export default App