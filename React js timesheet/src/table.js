import React from 'react'
import { FaPlus } from "react-icons/fa6";
 
const InputArea = ({handleSubmit, items, InputText,setInputText, TueHour, WedHour, ThurHour, FriHour, SatHour, SunHour, setTueHour, setWedHour, setThurHour, setFriHour, setSatHour,setSunHour, ProjName, setProjName, TaskName, setTaskName, com, setcom, RowTotal, setRowTotal}) => {
  return (
    <div className='parent'>
        
        <div className='main'>
        <div className="d-flex p-2 mb-3 fs-5" style={{background:'#19105B', color:'#fff', height:'40px'}}>TimeSheet</div>
          <table className='table'>
          <tr style={{background:'#19105B', color:'#fff'}}>
              <th>Project Type</th>
              <th>Project Name</th>
              <th>Task Name</th>
              <th>Comments</th>
              <th>Mon 29</th>
              <th>Tue 30</th>
              <th>Wed 31</th>
              <th>Thu 1</th>
              <th>Fri 2</th>
              <th>Sat 3</th>
              <th>Sun 4</th>
              <th>Total</th>
              <th>   </th>
          </tr>
          <tr className='border-bottom'>
              <td>BAU Activity</td>
              <td>
                  <select value={ProjName} onChange={(e) => setProjName(e.target.value)}>
                      <option selected hidden>Project</option>
                      <option>Sales</option>
                      <option>Events</option>
                      <option>Leave</option>
                      <option>Delivery</option>
                  </select>
              </td>
              <td>
                  <select value={TaskName} onChange={(e) => setTaskName(e.target.value)}>
                      <option selected hidden>Task</option>
                      <option>HTML</option>
                      <option>CSS</option>
                      <option>Bootstrap</option>
                      <option>JavaScript</option>
                      <option>React</option>
                  </select>
              </td>
              <td><input autoFocus type='text' value={com} onChange={(e) => setcom(e.target.value)} id='com'/></td>
              <td><input type='text' style={{ width: '50px', height: '20px'}} value={InputText} onChange={(e) => setInputText(e.target.value)}/></td>
              <td><input type='text' style={{ width: '50px', height: '20px'}} value={TueHour} onChange={(e) => setTueHour(e.target.value)}/></td>
              <td><input type='text' style={{ width: '50px', height: '20px'}} value={WedHour} onChange={(e) => setWedHour(e.target.value)}/></td>
              <td><input type='text' style={{ width: '50px', height: '20px'}} value={ThurHour} onChange={(e) =>{ setThurHour(e.target.value);console.log(ThurHour) }}/></td>
              <td><input type='text' style={{ width: '50px', height: '20px'}} value={FriHour} onChange={(e) => setFriHour(e.target.value)}/></td>
              <td><input type='text' style={{ width: '50px', height: '20px'}} value={SatHour} onChange={(e) => setSatHour(e.target.value)}/></td>
              <td><input type='text' style={{ width: '50px', height: '20px'}} value={SunHour} onChange={(e) => setSunHour(e.target.value)}/></td>
                <td></td>
              <td><button type='submit' onClick={handleSubmit}><FaPlus /></button></td>
          </tr>
          {
            items.map((item) => (
              <tr className='drow'>
                <td className='roww'>BAU Activity</td>
                <td>{item.ProjName}</td>
                <td>{item.TaskName}</td>
                <td>{item.com}</td>
                <td>{item.Mon}</td>
                <td>{item.Tue}</td>
                <td>{item.Wed}</td>
                <td>{item.Thur}</td>
                <td>{item.Fri}</td>
                <td>{item.Sat}</td>
                <td>{item.Sun}</td>
                <td>{item.RT}</td> 
                <td></td>
              </tr>
            ))
          }
          
          
          </table>
        </div>
    </div>
  )
}
 
export default InputArea