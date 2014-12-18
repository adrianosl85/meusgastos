using CommonServiceLocator.SimpleInjectorAdapter;
using Microsoft.Practices.ServiceLocation;
using SimpleInjector;
using SimpleInjector.Integration.Web.Mvc;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Dominio
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {

            var container = new Container();
            ServiceLocator.SetLocatorProvider(() => new SimpleInjectorServiceLocatorAdapter(container));
            Registrator.Register(container);
            DependencyResolver.SetResolver(new SimpleInjectorDependencyResolver(container));

            AreaRegistration.RegisterAllAreas();

            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}