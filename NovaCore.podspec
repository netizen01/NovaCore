Pod::Spec.new do |spec|

    spec.name                   = 'NovaCore'
    spec.version                = '0.7'
    spec.summary                = 'Common Extensions and Utilities for Nova Packages'

    spec.homepage               = 'https://github.com/netizen01/NovaCore'
    spec.license                = { :type => 'MIT', :file => 'LICENSE' }
    spec.author                 = { 'Netizen01' => 'n01@invco.de' }

    spec.ios.deployment_target  = '9.3'
    spec.tvos.deployment_target = '11.2'

    spec.source                 = { :git => 'https://github.com/netizen01/NovaCore.git',
                                    :tag => spec.version.to_s }
    spec.source_files           = 'Source/**/*.swift'
    spec.pod_target_xcconfig    = { 'SWIFT_VERSION' => '4.2' }

end
