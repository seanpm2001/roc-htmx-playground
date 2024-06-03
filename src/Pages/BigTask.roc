module [view]

import html.Html exposing [div, text, table, thead, tbody, tr, th, td]
import html.Attribute exposing [class]
import Layout
import Model
import NavLinks
import Bootstrap

view : { session : Model.Session, tasks : List Model.BigTask } -> Html.Node
view = \{ session, tasks } ->
    Layout.layout
        {
            session,
            description: "Just making a big table",
            title: "BigTask",
            navLinks: NavLinks.navLinks "BigTask",
        }
        [
            div [class "container-fluid"] [
                div [class "row align-items-center justify-content-center"] [
                    Html.h1 [] [Html.text "Big Task Table"],
                    Html.p [] [text "This table is big and has many tasks, each task is a big task..."],
                ],
            ],
            Bootstrap.renderTable dataTable tasks,
        ]

dataTable : Bootstrap.DataTable Model.BigTask
dataTable = Bootstrap.newTable {
    headings : [
            {
                label: "Reference ID",
                sorted: None,
                renderValueFn: \task, _ -> Html.text task.referenceId,
            },
            {
                label: "Customer ID",
                sorted: None,
                renderValueFn: \task, idx  ->
                    idStr = "customer-id-$(Num.toStr idx)"
                    Html.form [] [
                        Html.label [Attribute.for idStr, Attribute.hidden ""] [Html.text "Customer ID $(Num.toStr idx)"],
                        (Html.element "input") [Attribute.type "text", class "form-control", Attribute.id idStr, Attribute.name idStr, Attribute.value task.customerReferenceId] []
                    ],
            },
            {
                label: "Date Created",
                sorted: None,
                renderValueFn: \task, _ -> Html.text (Model.dateToStr task.dateCreated),
            },
            {
                label: "Date Modified",
                sorted: None,
                renderValueFn: \task, _ -> Html.text (Model.dateToStr task.dateCreated),
            },
            {
                label: "Title",
                sorted: None,
                renderValueFn: \task, _ -> Html.text task.title,
            },
            {
                label: "Description",
                sorted: None,
                renderValueFn: \task, _ -> Html.text task.description,
            },
            {
                label: "Status",
                sorted: None,
                renderValueFn: \task, _ -> Html.text (Model.statusToStr task.status),
            },
            {
                label: "Priority",
                sorted: None,
                renderValueFn: \task, _ -> Html.text (Model.priorityToStr task.priority),
            },
            {
                label: "Scheduled Start Date",
                sorted: None,
                renderValueFn: \task, _ -> Html.text (Model.dateToStr task.scheduledStartDate),
            },
            {
                label: "Scheduled End Date",
                sorted: None,
                renderValueFn: \task, _ -> Html.text (Model.dateToStr task.scheduledEndDate),
            },
            {
                label: "Actual Start Date",
                sorted: None,
                renderValueFn: \task, _ -> Html.text (Model.dateToStr task.actualStartDate),
            },
            {
                label: "Actual End Date",
                sorted: None,
                renderValueFn: \task, _ -> Html.text (Model.dateToStr task.actualEndDate),
            },
            {
                label: "System Name",
                sorted: None,
                renderValueFn: \task, _ -> Html.text task.systemName,
            },
            {
                label: "Location",
                sorted: None,
                renderValueFn: \task, _ -> Html.text task.location,
            },
            {
                label: "File Reference",
                sorted: None,
                renderValueFn: \task, _ -> Html.text task.fileReference,
            },
            {
                label: "Comments",
                sorted: None,
                renderValueFn: \task, _ -> Html.text task.comments,
            },
        ],
}
