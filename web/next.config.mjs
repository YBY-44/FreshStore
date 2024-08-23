/** @type {import('next').NextConfig} */
const nextConfig = {
    images:{
        remotePatterns:[
            {hostname: 'localhost'},
            {hostname: 'res.cloudinary.com'}
        ]
    }
};

export default nextConfig;
