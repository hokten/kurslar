import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [sayi1, setSayi1] = useState(0)
  const [sayi2, setSayi2] = useState(0)

  return (
    <>
	<input type="number" id="sayi1" name="sayi1" value={sayi1} onChange={(e) => setSayi1(e.target.value)} />
	+
	<input type="number" id="sayi2" name="sayi2" value={sayi2} onChange={(e) => setSayi2(e.target.value)} />
	= <span>{Number(sayi1) + Number(sayi2)}</span>
    </>
  )
}

export default App
