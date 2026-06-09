import { createContext, useContext, useState, useEffect } from 'react'
import { api } from '../services/api'

const AuthContext = createContext(null)

export function AuthProvider({ children }) {
  const [usuario, setUsuario] = useState(undefined)

  useEffect(() => {
    api.get('/auth/me')
      .then(setUsuario)
      .catch(() => setUsuario(null))
  }, [])

  async function login(email, senha) {
    const data = await api.post('/auth/login', { email, senha })
    setUsuario(data)
    return data
  }

  async function logout() {
    await api.post('/auth/logout', {})
    setUsuario(null)
  }

  return (
    <AuthContext.Provider value={{ usuario, login, logout }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  return useContext(AuthContext)
}
