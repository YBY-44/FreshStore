/** @type {import('next').NextConfig} */
const nextConfig = {
    images:{
        remotePatterns:[
            {hostname: 'freshstore-production.up.railway.app'},
            {hostname: 'res.cloudinary.com'}
        ]
    }
};

export default nextConfig;
