import React, { useEffect, useState } from 'react';
    const LogoutPopup = () => {
        const [signoutTime, setSignoutTime] = useState(10000);
        const [warningTime, setWarningTime] = useState(15000);
        let warnTimeout;
        let logoutTimeout;

        const warn = () => {
            console.log('Warning');
        };
        const logout = () => {
            console.log('You have been loged out');
        }

        const destroy = () => {
            console.log('Session destroyed');
        }
        const setTimeouts = () => {
            warnTimeout = setTimeout(warn, warningTime);
            logoutTimeout = setTimeout(logout, signoutTime);
        };

        const clearTimeouts = () => {
            if (warnTimeout) clearTimeout(warnTimeout);
            if (logoutTimeout) clearTimeout(logoutTimeout);
        };

        useEffect(() => {

            const events = [
                'load',
                'mousemove',
                'mousedown',
                'click',
                'scroll',
                'keypress'
            ];

            const resetTimeout = () => {
                clearTimeouts();
                setTimeouts();
            };

            for (let i in events) {
                window.addEventListener(events[i], resetTimeout);
            }

            setTimeouts();
            return () => {
                for(let i in events){
                    window.removeEventListener(events[i], resetTimeout);
                    clearTimeouts();
                }
            }
        },[]);


        return <div></div>
    }
    export default LogoutPopup;