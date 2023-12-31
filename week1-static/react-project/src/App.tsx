import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {


  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>CloudOps Challange <span style={ {color: '#f531f5'}}>Week 1</span></h1>
      <a href="https://github.com/inderharrysingh/cloudops-challange.git" target="_blank">
         <h2>Github</h2>
        </a>
      <div className="card">
      </div>
    </>
  )
}

export default App
