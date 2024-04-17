
import { useState } from 'react';
import 'primeicons/primeicons.css';
import './style.css'
import "primereact/resources/themes/lara-light-cyan/theme.css";
import React from 'react'; 
import { Menu } from 'primereact/menu';
import InputArea from './table';

import { Accordion, AccordionTab } from 'primereact/accordion';
import { TreeTable } from 'primereact/treetable';



import { Column } from 'primereact/column';
        

export default function BasicDemo() {
    let dashboard = [
      { 
        label: <img src="jin symbol.png" alt="Image" width="30" height="30"/>, 
        icon: null, 
    },
        { label: 'Dashboard',},
        { label: 'TimeSheet',},
        { label: 'Leave',  },
        { label: 'Work from home',  },
        { label: 'Feedback',  },
        { label: 'Survey',  },
        { label: 'Service Desks',  },
        { label: 'Forms',  },
        { label: 'Travels',  },
        { label: 'Expenses',  },
        { label: 'Resourcing', style: { marginBottom: '100px' }, },
        { separator: true },
        { label: 'Name', icon: 'pi pi-sign-out' },
    ];
    
    

  const [items, setItems] = useState([])
  const [InputText, setInputText] = useState('')
  const [TueHour, setTueHour] = useState('')
  const [WedHour, setWedHour] = useState('')
  const [ThurHour, setThurHour] = useState('')
  const [FriHour, setFriHour] = useState('')
  const [SatHour, setSatHour] = useState('')
  const [SunHour, setSunHour] = useState('')
  const [ProjName, setProjName] = useState('')
  const [TaskName, setTaskName] = useState('')
  const [com, setcom] = useState('')
  const[RowTotal,setRowTotal]=useState('')
 
  const handleText = (e) => {
    console.log('hi')
  }

  
 
  const handleSubmit = (e) => {
    const id = items.length ? items[items.length -1].id + 1 : 1;
    
    const rt = Number(InputText) + Number(TueHour) + Number(WedHour) + Number(ThurHour) + Number(FriHour) + Number(SatHour) + Number(SunHour)
    console.log(rt)
    const newRow = {id:id ,Mon:InputText, Tue:TueHour, Wed:WedHour, Thur: ThurHour, Fri: FriHour, Sat: SatHour, Sun: SunHour, ProjName: ProjName, TaskName: TaskName, com:com, RT:rt}
    setRowTotal(rt);
    const newItems = [...items, newRow]
    setItems(newItems)
    setInputText('');
    setTueHour('');
    setWedHour('');
    setThurHour('');
    setFriHour('');
    setSatHour('');
    setSunHour('');
    // console.log(InputText)
  } 
   

    return (
        <div>
          <div><Menu model={dashboard} id="menu" style={{ position: 'absolute', margin: -10 }}/></div>
        <div className="moveDiv">
            <h1 style={{color:'#19105B'}}>Timesheet</h1>
            <h3 style={{color:'#19105B'}}>Total hours: 0.0</h3>
            <Accordion style={{background:'#19105B'}}>
  <AccordionTab header="Allocation Extension" style={{ background: '#19105B' }}>
    <TreeTable tableStyle={{ minWidth: '50rem' }}>
      <Column field="name" header="Project Name" expander rowClassName={(rowData) => (rowData.type === 'Project' ? { background: 'pink' } : null)}></Column>
      <Column field="type" header="Project Type" rowClassName={(rowData) => (rowData.type === 'Project' ? { background: 'pink' } : null)}></Column>
      <Column field="size" header="Project End Date" rowClassName={(rowData) => (rowData.type === 'Project' ? { background: 'pink' } : null)}></Column>
      <Column field="type" header="Allocation End Date" rowClassName={(rowData) => (rowData.type === 'Project' ? { background: 'pink' } : null)}></Column>
      <Column field="type" header="Allocation Extension" rowClassName={(rowData) => (rowData.type === 'Project' ? { background: 'pink' } : null)}></Column>
    </TreeTable>
  </AccordionTab>
</Accordion>

    <InputArea
        handleText = {handleText}
        handleSubmit={handleSubmit}
        items={items}
        InputText = {InputText}
        setInputText = {setInputText}
        TueHour = {TueHour}
        WedHour = {WedHour}
        ThurHour = {ThurHour}
        FriHour = {FriHour}
        SatHour = {SatHour}
        SunHour = {SunHour}
        setTueHour = {setTueHour}
        setWedHour = {setWedHour}
        setThurHour = {setThurHour}
        setFriHour = {setFriHour}
        setSatHour = {setSatHour}
        setSunHour = {setSunHour}
        ProjName = {ProjName}
        setProjName = {setProjName}
        TaskName = {TaskName}
        setTaskName = {setTaskName}
        com = {com}
        setcom = {setcom}
        RowTotal = {RowTotal}
        setRowTotal = {setRowTotal}
      />

    <div style={{ display: 'flex', justifyContent: 'flex-end', marginTop: '20px' }}>
          <button style={{ padding: '10px', background: '#19105B', color: 'white',margin:'0px 10px' }}>Save</button>
          <button style={{ display: 'flex', alignItems: 'center', padding: '10px', background: '#FF6196', color: 'white', borderRadius: '5px', border: 'none' }}>
            Submit <span style={{ marginLeft: '5px' }}></span>
          </button>
        </div>
        </div>
      
        </div>
    )
}
        