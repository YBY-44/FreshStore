import { registerType } from "@/types";
import { log } from "console";
const { default: axios } = require('axios');


const axiosClient = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL,
});
const getCategory = async () => {
    return await axiosClient.get('/categories?populate=*');
};
const getSliders = async () => {
    return await axiosClient.get('/sliders?populate=*');
}
const getProducts = async () => {
    return await axiosClient.get('/products?populate=*');
};
const getProductsByCategory = async (category: string) => {
    return await axiosClient.get(`/products?filters[categories][name][$in]=${category}&populate=*`);
}
const register = async (data: registerType) => {
    console.log('data: ', data);
    return await axiosClient.post('/auth/local/register', {
      username:data.Username,
      email:data.Email,
      password:data.Password
    });
}
const GlobalAPI = {
  getCategory,
  getSliders,
  getProducts,
  getProductsByCategory,
  register
};

export default GlobalAPI;
