@react.component
let make = () => {
  let janet_message: MessageModel.message = {
    user_name: "janet",
    avatar: "janet.jpg",
    message: "Janet",
  }

  let (messages, setMessages) = React.useState(() => [])
  let (value, setValue) = React.useState(() => "")

  let onClick = _ => {
    let new_message: MessageModel.message = {
      user_name: "me",
      avatar: "pepita.jpg",
      message: value,
    }

    setValue(_ => "")

    setMessages(messages => messages->Js.Array2.concat([new_message]))
    Js.Global.setTimeout(() => {
      setMessages(messages => messages->Js.Array2.concat([janet_message]))
    }, 400)->ignore
  }

  let handleInputChange = e => {
    let s = ReactEvent.Form.currentTarget(e)["value"]

    setValue(_ => s)
  }

  <div className="h-screen w-full">
    <div
      className="absolute bg-zinc-800 w-full h-20 flex items-center p-4  overflow-hidden top-0 left-0">
      <span className="text-white text-xl"> {React.string("Janet Chat")} </span>
    </div>
    <div
      className="absolute top-20 bottom-20 flex overflow-auto w-full flex-col-reverse bg-[#343541]">
      <div className="flex flex-col">
        {messages->Array.map(msg => <Message message=msg />)->React.array}
      </div>
    </div>
    <div
      className="absolute bottom-0 left-0 flex items-center justify-center h-20 bg-[#353740] w-full">
      <div
        className="flex justify-center p-1 w-9/12 h-10 rounded-lg border border-[#32323d] bg-[#41414e]">
        <input
          onChange={handleInputChange}
          onKeyDown={e => {
            if ReactEvent.Keyboard.key(e) == "Enter" {
              onClick()
            }
          }}
          value={value}
          placeholder="Send a message..."
          cols=70
          className="w-11/12 resize-none whitespace-nowrap bg-[#41414e] text-white focus:outline-none"
        />
        <div onClick className="rounded-full h-8 w-8 focus:outline-none p-2 cursor-pointer">
          <img src="send.svg" />
        </div>
      </div>
    </div>
  </div>
}
