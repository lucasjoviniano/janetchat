@react.component
let make = (~message: MessageModel.message) => {
  let is_janet = message.user_name == "janet"

  <div
    className={`flex py-6 px-20 h-min w-full gap-2 ${is_janet ? "bg-[#444755]" : "bg-[#343541]"}`}>
    <div className="w-10 h-10 overflow-hidden rounded-full">
      <img src=message.avatar alt=message.user_name />
    </div>
    <div className="text-[#d8e8e2] pt-2 texl-lg"> {React.string(message.message)} </div>
  </div>
}
