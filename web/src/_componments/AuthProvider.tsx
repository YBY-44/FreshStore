'use client';
import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { parseCookies, setCookie, destroyCookie } from 'nookies';
import { UserType } from '@/types';
import path from 'path';
import { useRouter } from 'next/navigation';

interface AuthContextType {
  isLogin: boolean;
  login: (jwt: string, user: UserType) => void;
  logout: () => void;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [isLogin, setIsLogin] = useState(false);
  const router = useRouter();
  useEffect(() => {
    const cookies = parseCookies();
    const jwt = cookies.jwt || null;
    setIsLogin(!!jwt);
  }, []);

  const login = (jwt: string, user: UserType) => {
    console.log(user);
    setCookie(null, 'jwt', jwt, {
        maxAge: 2 * 24 * 60 * 60,
        path: '/',
      });

    setCookie(null, 'user', JSON.stringify(user), {
        maxAge: 2 * 24 * 60 * 60,
        path: '/',
      });
    setIsLogin(true);
    router.push('/');
  };

  const logout = () => {
    destroyCookie(null, 'jwt', {
        path: '/',
    });
    destroyCookie(null, 'user', {
        path: '/',
    });
    setIsLogin(false);
    router.push('/login');
  };

  return (
    <AuthContext.Provider value={{ isLogin, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};
