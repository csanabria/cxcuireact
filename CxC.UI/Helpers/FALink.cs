namespace CxC.UI
{
    using System;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Mvc.Html;
    public static class HtmlExtensions
    {
        public static MvcHtmlString FALink(this HtmlHelper htmlHelper, string action, string controller, string link_text, string fa_class, string btn_css_classes = "", string button_id = "", object route_values = null)
        {
            // declare the span                 
            TagBuilder span = new TagBuilder("span");
            span.AddCssClass($"fa fa-{fa_class}");
            span.MergeAttribute("aria-hidden", "true");

            // declare the anchor tag
            TagBuilder anchor = new TagBuilder("a");
            // Add the href attribute to the <a> element
            if (string.IsNullOrEmpty(controller) || string.IsNullOrEmpty(action))
                anchor.MergeAttribute("href", "#");
            else
                anchor.MergeAttribute("href", new UrlHelper(HttpContext.Current.Request.RequestContext).Action(action, controller, route_values));

            // Add the <span> element and the text to the <a> element
            anchor.InnerHtml = $"{span} {link_text}";
            anchor.AddCssClass(btn_css_classes);
            anchor.GenerateId(button_id);
            // Create the helper
            return MvcHtmlString.Create(anchor.ToString(TagRenderMode.Normal));
        }
    }
}